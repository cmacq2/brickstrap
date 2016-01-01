# Namespacing
To avoid name collisions between functions or variables defined in user code (e.g. hooks), and functions or variables defined by brickstrap a namespacing convention is used.
This document describes this convention in detail:
 - How symbols are marked as belonging to one or another namespace
 - How brickstrap treats symbols from the various namespaces
 - How user code should treat these


## Summary
The table below summarises how namespacing is handled in brickstrap code and what the implications are for user code (e.g. hooks).

| Namespace          | Prefix           | Call functions  | Read variables  | Write variables  | Set variables (env) | 'Owner'     |
|:-------------------|:-----------------|:----------------|:----------------|:-----------------|:--------------------|:------------|
| Public             | `br_` or `BR_`   | As documented.  | Yes.            | As documented.   | As documented.      | brickstrap. |
| Private            | `brp_` or `BRP_` | No.             | No.             | No.              | No.                 | brickstrap. |
| Global             | (none)           | Yes.            | Yes.            | Yes.             | Yes.                | brickstrap. |
| Project            | (custom)         | Yes.            | Yes.            | Yes.             | Yes.                | You.        |


## Used namespaces
Symbols may generally be classified as belonging to one of four namespaces:
 * Public brickstrap symbols, identified by the prefixes `br_` or `BR_`
 * Private brickstrap symbols, identified by the prefixes `brp_` or `BRP_`
 * Global brickstrap symbols, documented as such and not marked by any prefix
 * Project symbols: any other symbols introduced by user code, not belonging to any of the previous namespaces.
   It is recommended to pick a namespace prefix to be sure to avoid name collisions, e.g. `MY_`.

### Public brickstrap namespace (br_)
Function and variable names starting with either `br_` or `BR_` belong to the public brickstrap namespace.
In general variables and functions may be used according to the corresponding documentation.
Variables are subject to change from within brickstrap, so user code should not use them for storing private state that is later relied upon.

### Private brickstrap namespace (brp_)
Function and variable names starting with either `brp_` or `BRP_` belong  to the private brickstrap namespace.
These are reserved for the private use by brickstrap code and user code **must not** attempt to use these directly.

### Global namespace
A number of global variables (and functions?) are available. These symbols are not marked with a namespace prefix and are documented separately.
In general, symbols from the global namespace may be used and altered freely by user code.
These symbols may also be updated by brickstrap code at any point, so user code should not use them for storing private state that is later relied upon.

TODO: list global variables that aren't properly namespaced.

### Project namespace
Symbols in this namespace may or may not start with a custom prefix and are fully controlled by user code and will not be inspected, set, modified or otherwise used by brickstrap code.
It is recommended that projects adopt a namespace prefix (e.g. `MY_`) to mark variables and functions from the project namespace.
