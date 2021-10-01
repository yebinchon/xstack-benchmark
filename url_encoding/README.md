Provide a function or mechanism to convert a provided string into URL encoding representation.

In URL encoding, special characters, control characters and extended characters are converted into a percent symbol followed by a two digit hexadecimal code, So a space character encodes into %20 within the string.

For the purposes of this task, every character except 0-9, A-Z and a-z requires conversion, so the following characters all require conversion by default:

- ASCII control codes (Character ranges 00-1F hex (0-31 decimal) and 7F (127 decimal).
- ASCII symbols (Character ranges 32-47 decimal (20-2F hex))
- ASCII symbols (Character ranges 58-64 decimal (3A-40 hex))
- ASCII symbols (Character ranges 91-96 decimal (5B-60 hex))
- ASCII symbols (Character ranges 123-126 decimal (7B-7E hex))
- Extended characters with character codes of 128 decimal (80 hex) and above.
