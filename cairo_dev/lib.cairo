#[starknet::interface]
pub trait IDrone<TContractState> {
    fn decide(ref self: TContractState, input: felt252) -> felt252;
    fn get_last(self: @TContractState) -> felt252;
}

#[starknet::contract]
pub mod Drone {
    // Explicitly import required traits for storage access
    use starknet::storage::StoragePointerReadAccess;
    use starknet::storage::StoragePointerWriteAccess;

    #[storage]
    struct Storage {
        last_decision: felt252,
    }

    #[abi(embed_v0)]
    impl DroneImpl of super::IDrone<ContractState> {
        fn decide(ref self: ContractState, input: felt252) -> felt252 {
            let decision = if input == 1 {
                1
            } else {
                0
            };
            // Uses StoragePointerWriteAccess
            self.last_decision.write(decision);
            decision
        }

        fn get_last(self: @ContractState) -> felt252 {
            // Uses StoragePointerReadAccess
            self.last_decision.read()
        }
    }
}
