# fmtstr in VisiData

You may have noticed the `fmtstr` column in the **Columns Sheet**, and wondered what it did.

[image of fmtstr]

The `fmtstr` column defines the formatting of a Column's displayed values.
This allows users to:
* have control over how many digits are displayed for floating points
* modify date types to include a section for time
* separate every 3 digits with a comma (e.g. `1,000`)

This is all very neat, but can be tricky to get started with. So, I wanted to go into the heart of this feature.

This blogpost is going to cover:
* setting of the fmtstr;
* foundations of display and typing in VisiData;
* what impact the fmtstr has on internal VisiData calculations and saved outputs.

VisiData has a concept of core values, typed values, and displayed values.

The core value is the fundamental undercurring value behind any given cell. It can be a string, a number, a list, `None`, a Python object, etc.


- int has grouping by default
- when starting char for fmtstr is %, uses locale.format_string for numeric types, and that is grouped (grouping=True)
- if start char is not % (should be {}), then it uses python's string.format

{} is more pythonic
%0.2f is more locale-friendly
    - if you have your system set up right it should even use the right separator chars

- why do we not have the `,` separator by default?
    - display values are saved

- default is {:.02f}
    - %0.2f will be automatically grouped
- the currency type will have the grouping by default
    - we no longer are using locale.currency for currency formatter
- there will be two new options

- option('disp_currency_fmt', '%.02f', 'default fmtstr to format for currency values', replay=True)
- option('disp_float_fmt', '{:.02f}', 'default fmtstr to format for float values', replay=True)
- option('disp_int_fmt', '{:.0f}', 'default fmtstr to format for int values', replay=True)


from commit:
- add options.disp_currency_fmt
- add options.disp_int_fmt
- add options.disp_date_fmt

- for these and disp_float_fmt:
  - if starts with '%', use locale.format_string (with grouping)
    - otherwise use python string.format

    default for int/float is string.format for roundtripping accurately in data text files like csv.
    currency uses locale (but no longer locale.currency--will anyone notice?) and is grouped.
## for notes
- we need a table for our formats with things like "has numeric types"
    - "may be imported into another tool"
- `=weight*1000000` when weight is a string