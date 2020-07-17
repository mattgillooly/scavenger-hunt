# Scavenger Hunt

Generate a .pptx presentation containing randomly-ordered prompts for a scavenger hunt.

Perhaps useful for other things too?

## Motivation:

I was looking for a way to run a remote scavenger hunt tournament as a distributed activity with my extended family.
The same people who would be participating were also submitting prompt ideas to a Google Form that wrote to a Google Sheet.
I was participating as well, so I needed a way to present each individual prompt without having an unfair advantage.
This script generates a .pptx file that I could present to the call.

## Usage:

Change `URL` in `fetch_scavenger_hunt_prompts.rb` to match the publicly-readable CSV URL for the Google Sheet containing your prompts.

Then run:

```sh
ruby ./fetch_scavenger_hunt_prompts.rb > scavenger.txt
pandoc scavenger.txt -o scavenger.pptx
open scavenger.pptx
```
