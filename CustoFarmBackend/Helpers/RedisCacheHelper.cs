using Microsoft.Extensions.Caching.Distributed;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using System.Threading.Tasks;

namespace CustoFarmBackend.Helpers
{
    public static class RedisCacheHelper
    {
        public static async Task SetRecordAsync<T>(this IDistributedCache cache, 
            string recordId, T data, TimeSpan? absulteExpireTime= null, TimeSpan? unusedExpirdTime=null)
        {
            var options = new DistributedCacheEntryOptions();
            options.AbsoluteExpirationRelativeToNow = absulteExpireTime ?? TimeSpan.FromSeconds(60);
            options.SlidingExpiration = unusedExpirdTime;
            var jsonData = JsonSerializer.Serialize(data);

            await cache.SetStringAsync(recordId, jsonData, options);
        }


        public static async Task<T> GetRecordAsync<T>(this IDistributedCache cache, string recordId)
        {
            var jsonData = await cache.GetStringAsync(recordId);
            if (jsonData is null)
            {
                return default(T);
            }

            return JsonSerializer.Deserialize<T>(jsonData);
        }
    }
}
