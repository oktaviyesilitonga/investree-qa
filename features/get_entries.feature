@entries

Feature: Get Entries

  @entries
  Scenario: 00001-User able to get all entries
    When user able to get all entries
    Then user should able to get all entries successfully

  @filter_by_title
  Scenario Outline: <case_id>-user able to filter entries by title
    When user able to 'get' filter entries by '<param>'
    Then user should able to filter entries by '<filters>' and '<value>'

    Examples:
    | case_id   | param                                             | filters        | value                       |
    | 00002     | entries?title=Covid-19                            | title          | Covid-19                    |
    | 00003     | entries?title=Cats                                | title          | Cats                        |
    | 00004     | entries?title=Dogs                                | title          | Dogs                        |
    | 00005     | entries?title=FishWatch                           | title          | FishWatch                   |
    | 00006     | entries?title=PlaceBear                           | title          | PlaceBear                   |
    | 00007     | entries?description=Random dog facts              | description    | Random dog facts            | 
    | 00008     | entries?description=Placeholder Dog pictures      | description    | Placeholder Dog pictures    |
    | 00009     | entries?description=Anime industry news           | description    | Anime industry news         |
    | 00010     | entries?description=Met Museum of Art             | description    | Met Museum of Art           |
    | 00011     | entries?description=Generate & convert colors     | description    | Generate & convert colors   |
    | 00012     | entries?auth=apiKey                               | auth           | apiKey                      | 
    | 00013     | entries?auth=OAuth                                | auth           | OAuth                       |  
    | 00014     | entries?https=true                                | https true     |                             | 
    | 00015     | entries?https=false                               | https false    |                             |
    | 00016     | entries?cors=yes                                  | cors           | yes                         | 
    | 00017     | entries?cors=no                                   | cors           | no                          |
    | 00018     | entries?category=Animals                          | category       | Animals                     |
