
import getpass
import redis
import psycopg2

# PostgreSQL connection details
DB_NAME = input("Enter your PostgreSQL database name: ").strip()
DB_USER = input("Enter PostgreSQL username [postgres]: ").strip() or "postgres"
DB_PASSWORD = getpass.getpass("Enter PostgreSQL password: ")

# Redis connection details
cache = redis.Redis(
    host="127.0.0.1",
    port=6379,
    db=0,
    decode_responses=True,
    socket_connect_timeout=5,
    socket_timeout=5
)

CACHE_KEY = "enrollment_count"
CACHE_TTL = 300  # 5 minutes

try:
    # Verify Redis connection
    cache.ping()
    server_info = cache.info("server")

    print("\nRedis connected successfully.")
    print("Redis database:", 0)
    print("Redis server version:", server_info.get("redis_version"))
    print("Redis server ID:", server_info.get("run_id"))

    # Check whether the result is already cached
    cached_result = cache.get(CACHE_KEY)

    if cached_result is not None:
        print("\nCACHE HIT - Retrieved result from Redis.")
        print("Total enrollments:", cached_result)
        print("Remaining TTL:", cache.ttl(CACHE_KEY), "seconds")

    else:
        print("\nCACHE MISS - Fetching result from PostgreSQL.")

        # Query PostgreSQL
        with psycopg2.connect(
            host="localhost",
            port=5432,
            dbname=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD,
            connect_timeout=5
        ) as conn:
            with conn.cursor() as cursor:
                cursor.execute("SELECT COUNT(*) FROM enrollments;")
                result = cursor.fetchone()[0]

        print("Total enrollments:", result)

        # Store the result in Redis for 300 seconds
        saved = cache.setex(CACHE_KEY, CACHE_TTL, str(result))

        print("Redis SETEX response:", saved)

        # Verify the value and TTL immediately
        saved_value = cache.get(CACHE_KEY)
        remaining_ttl = cache.ttl(CACHE_KEY)

        print("Saved value:", saved_value)
        print("Remaining TTL:", remaining_ttl, "seconds")

        if saved_value == str(result) and remaining_ttl > 0:
            print("Cache stored and verified successfully.")
        else:
            print("ERROR: Cache verification failed.")

except redis.RedisError as error:
    print("Redis error:", error)

except psycopg2.Error as error:
    print("PostgreSQL error:", error)

finally:
    cache.close()
