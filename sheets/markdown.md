# markdown

## Headings:

    # h1      => <h1>h1</h1>
    ## h2     => <h2>h2</h2>
    ...
    ###### h6 => <h6>h6</h6>

## Paragraphs

    Separate paragraphs with double newlines.  => <p>Separate paragraphs with double newlines.</p>

    This is a second paragraph.                => <p>This is a second paragraph.
    This is not a third paragraph.             => This is not a third paragraph.</p>

## Blockquotes:
                                   => <blockquote>
    > This is a quote.             =>   <p>This is a quote. You can use multiple lines.</p>
    > You can use multiple lines.  => </blockquote>

## Code:

    `code goes here` => <code>code goes here</code>

    ```                                        => <code>
    <ul>                                       => <ul>
      <li>Some text</li>                       =>   <li>Some text</li>
    </ul>                                      => </ul>
    ```                                        => </code>

##  Lists:

               =>   <ul>
     * item 1  =>     <li>item 1</li>
     * item 2  =>     <li>item 2</li>
     * item 3  =>     <li>item 3</li>
               =>   </ul>

               =>   <ol>
     1. item 1 =>     <li>item 1</li>
     3. item 2 =>     <li>item 2</li>
     1. item 3 =>     <li>item 3</li>
               =>   </ol>

## Tables:

                                   => <table>
    Header     | Header            => <tr><th>Header</th><th>Header</th></tr>
    ---------- | ---------------
    Some       | Text              => <tr><th>Some</th><th>Text</th></tr>
    Another    | Example           => <tr><th>Another</th><th>Example</th></tr>
    Next       | Line              => <tr><th>Next</th><th>Line</th></tr>
                                   => <table>

## Inline:

     *emphasis* => <em>emphasis</em>
     **strong** => <strong>strong</strong>

## Links:

    [Text to display](http://example.com/)  => <a href='http://example.com'>Text to display</a>

## Images:

    ![alt text](/path/to/image.jpg)  => <img src='/path/to/image.jpg alt='alt text' />
