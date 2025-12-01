 # Advent of Code Ruby Template

Simple, minimal setup for solving Advent of Code in Ruby.

## Structure

 - `bin/run` runs a specific day
 - `days/dayXX/solution.rb` holds the code for that day
 - `days/dayXX/input.txt` is your real puzzle input
 - `days/dayXX/sample.txt` is for the example from the problem statement or your own samples
 - `lib/` holds shared helpers

## Usage

 1. Make the runner executable:

    ```bash
    chmod +x bin/run
    ```

 2. Run a day (for example day 1 with the real input):

    ```bash
    ./bin/run 1
    ```

    Or with the sample input:

    ```bash
    ./bin/run 1 sample
    ```

 3. To add a new day, copy `days/day01` to `days/dayXX` and adjust the class name inside `solution.rb`.
