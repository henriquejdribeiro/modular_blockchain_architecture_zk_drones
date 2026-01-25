#[executable]
fn main(_input: u32) -> u32 {
    let mut count = 0_u32;
    let mut num = 2_u32;
    let mut primes = 0_u32;

    while count < 500_u32 {
        let mut is_prime = 1_u32;
        let mut i = 2_u32;

        while i * i <= num {
            if num % i == 0_u32 {
                is_prime = 0_u32;
                break;
            }
            i += 1_u32;
        }

        if is_prime == 1_u32 {
            count += 1_u32;
            primes = num;
        }
        num += 1_u32;
    }
    primes
}