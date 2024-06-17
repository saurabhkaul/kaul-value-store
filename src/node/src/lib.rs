use kv::KV;
struct Node <K,V>{
    id:usize,
    port:usize,
    store:KV<K, V>
}

impl<K, V> Node<K, V> {
    fn new(id:usize,port:usize)->Self<K,V>{
        Self{
            id,
            port,
            store:KV::new()
        }
    }

}

