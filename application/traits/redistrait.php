<?php
/**
 * Created by PhpStorm.
 * User: xiaoye.duan
 * Date: 2017/2/14
 * Time: 15:20
 */

namespace traits;

use think\cache\driver\Redis;

trait RedisTrait {
    public $redis = null ;

    public   function redis_init()
    {
        $config = [
            'host' => '118.24.89.246',
            'port' => 6379,
            'password' => 'zhuangdawang',
            'select' => 0,
            'timeout' => 0,
            'expire' => 0,
            'persistent' => false,
            'prefix' => '',
        ];
        $this->redis = new Redis($config);
        if(empty($this->redis))
        {
            return false;
        }

    }
    public  function redis_close()
    {
        if(!empty($this->redis))
        {
            $this->redis->close();
            unset($this->redis);
        }
    }
    public function redis_get($key)
    {
        if(!empty($this->redis))
        {
            return $this->redis->get(strtolower($key));
        }
        return false;
    }
    public function redis_mget($arrkey)
    {
        if(!empty($this->redis))
        {
            return $this->redis->mget(array_map("strtolower",$arrkey));
        }
        return false;
    }

    public function redis_set($key, $value, $ttl = 0)
    {
        if(!empty($this->redis))
        {
            if ($ttl > 0) {
                return $this->redis->set(strtolower($key),$value, $ttl);
            } else {
                return $this->redis->set(strtolower($key), $value);
            }
        }
        return false;
    }

    public function redis_has($key)
    {
        if(!empty($this->redis))
        {
            return $this->redis->exists(strtolower($key));
        }
        return false;
    }

    public function redis_del($key)
    {
        if(!empty($this->redis))
        {
            return $this->redis->del(strtolower($key));
        }
        return false;
    }

    public function redis_sadd($key, $value)
    {
        if(!empty($this->redis))
        {
            return $this->redis->sadd(strtolower($key), $value);
        }
        return false;
    }
    public function redis_srem($key, $value)
    {
        if(!empty($this->redis))
        {
            return $this->redis->srem(strtolower($key), $value);
        }
        return false;
    }
    public function redis_sismember($key, $value)
    {
        if(!empty($this->redis))
        {
            return $this->redis->sismember(strtolower($key), $value);
        }
        return false;
    }
    public function redis_smembers($key)
    {
        if(!empty($this->redis))
        {
            return $this->redis->smembers(strtolower($key));
        }
        return false;
    }

    public function redis_hget($key, $hashKey)
    {
        if(!empty($this->redis))
        {
            return $this->redis->hGet(strtolower($key),strtolower($hashKey));
        }
        return false;
    }

    public function redis_hgetall($key)
    {
        if(!empty($this->redis))
        {
            return $this->redis->hGetAll(strtolower($key));
        }
        return false;
    }

    public function redis_hset($key, $hashKey, $value )
    {
        if(!empty($this->redis))
        {
            return $this->redis->hSet(strtolower($key),strtolower($hashKey),$value);
        }
        return false;
    }
    public function redis_hdel($key, $hashKey1, $hashKey2 = null, $hashKeyN = null)
    {
        if(!empty($this->redis))
        {
            return $this->redis->hDel(strtolower($key),strtolower($hashKey1),strtolower($hashKey2),strtolower($hashKeyN));
        }
        return false;
    }

    public function redis_hdelall($key)
    {
        if(!empty($this->redis))
        {
            return $this->redis->hDelAll(strtolower($key));
        }
        return false;
    }


}