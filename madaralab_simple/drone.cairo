#[starknet::contract]
mod DroneDecision {
    #[storage]
    struct Storage {}

    #[external]
    fn decide(sensor_a: felt252, sensor_b: felt252) -> felt252 {
        if sensor_a + sensor_b > 100 {
            1
        } else {
            0
        }
    }
}