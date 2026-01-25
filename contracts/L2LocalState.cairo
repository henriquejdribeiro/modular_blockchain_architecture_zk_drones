%lang starknet

@storage_var
func last_prime() -> (res: felt) {}

@external
func set_prime(value: felt) {
    last_prime.write(value);
    return ();
}

@external
func get_prime() -> (res: felt) {
    let (v) = last_prime.read();
    return (v);
}
