Stringr Things
================

## Stranger Things Script Data

The Stranger Things transcripts for this project were extracted from PDF
files on
[8flix.com](https://8flix.com/collections/transcripts/stranger-things-2/).
Transcripts for all episodes of the first 4 seasons of Stranger Things
are included.

### stranger_things_all_dialogue.csv

| variable        | class     | description                                               |
|:----------------|:----------|:----------------------------------------------------------|
| line            | integer   | Order in which line appears in episode                    |
| raw_text        | character | Original text with both dialogue and stage directions     |
| stage_direction | character | Text describing what’s happening, or who is talking       |
| dialogue        | character | Dialogue spoken within the episode                        |
| start_time      | character | Time within the episode when the line starts being spoken |
| end_time        | character | Time within the episode when the line stops being spoken  |
| episode         | integer   | Episode number within the season                          |
| season          | integer   | Season number                                             |

### episodes.csv

| variable              | class     | description                      |
|:----------------------|:----------|:---------------------------------|
| season                | integer   | Season number                    |
| episode               | integer   | Episode number within the season |
| title                 | character | Title of the episode             |
| directed_by           | character | Director(s) of the episode       |
| written_by            | character | Writer(s) of the episode         |
| original_release_date | character | Release date of the episode      |
