use std::collections::HashMap;

pub struct KV <K,V>{
    pub inner:HashMap<K,V>
}

impl <K,V> KV <K,V> {
    pub fn new()->Self{
        Self{
            inner: HashMap::new()
        }
    }
    pub fn get(&self,key:&K)->Option<&V>{
        self.inner.get(key)
    }
    pub fn set(&self,key:K,value:&V){
        self.inner.set(key,value);
    }
}