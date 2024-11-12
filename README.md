# Periodic Table Script

This script allows users to retrieve information about chemical elements from a PostgreSQL database named `periodic_table`. It takes an atomic number, symbol, or name as an argument, queries the database, and displays details about the specified element.

## Prerequisites

- **PostgreSQL** installed and running.
- A database named `periodic_table.sql` with:
  - A table `elements` containing at least columns for `atomic_number`, `name`, and `symbol`.
  - A table `properties` containing columns for `atomic_mass`, `melting_point_celsius`, and `boiling_point_celsius`.
  - A table `types` that categorizes each element, with `type_id` referencing `properties`.
  
- Create `your postgres user` and `periodic_table` to connect to.

## Script Usage

### 1. Clone or Download the Script

Ensure the script file is saved and executable.

### 2. Run the Script

Execute the script with the following command:

```bash
./element <element>
```

### Arguments

- `<element>`: Provide the atomic number, symbol, or name of the element you want to look up.

### Examples

```bash
./element.sh 1
```

or

```bash
./element.sh H
```

or

```bash
./element.sh Hydrogen
```

### Output

If the element is found, the output will include:
- Atomic number
- Name and symbol
- Type of element
- Atomic mass
- Melting point in Celsius
- Boiling point in Celsius

#### Example Output:

```
The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
```

If the element is not found, the output will display:
```
I could not find that element in the database.
```

### Error Handling

If no argument is provided, the script will prompt:
```
Please provide an element as an argument.
```

