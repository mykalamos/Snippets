    public class MyMemoryCache<T> : MemoryCache where T : class
    {
        private readonly int absoluteTimeoutMinutes;

        private readonly object locker = new object();

        public MyMemoryCache(string name, int absoluteTimeoutMinutes = 5) : base(name)
        {
            this.absoluteTimeoutMinutes = absoluteTimeoutMinutes;
        }

        public T GetOrAdd(Func<T> fetchAction, string cacheKey)
        {
            var lazy = GetLazy(cacheKey);
            if (lazy == null)
            {
                lock (locker)
                {
                    lazy = GetLazy(cacheKey);
                    if (lazy == null)
                    {
                        lazy = new Lazy<T>(() =>
                        {
                            return fetchAction();
                        }, LazyThreadSafetyMode.ExecutionAndPublication);
                        Add(cacheKey, lazy, DateTime.Now.AddMinutes(absoluteTimeoutMinutes));
                    }
                }
            }
            T value = null;
            try
            {
                value = lazy.Value;
            }
            catch (Exception ex)
            {
                //
            }
            if (value == null)
            {
                // Because of thread-safety mode, if an exception occurs then a NULL value will be cached. Therefore, clear cache here
                Remove(cacheKey);
            }
            return value;
        }

        private Lazy<T> GetLazy(string cacheKey)
        {
            return Get(cacheKey) as Lazy<T>;
        }
    }
