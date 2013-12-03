# Credit: http://nubyonrails.com/articles/ruby-rails-test-rails-cheat-sheet
# Use 'cheat assert_raise' for more details

## Standard Ruby Assertions

    assert                  boolean
    assert_equal            expected, actual
    assert_raise            *args
    assert_raises           *args, &block
    assert_instance_of      klass, object
    assert_nil              object
    assert_kind_of          klass, object
    assert_respond_to       object, method
    assert_match            pattern, string
    assert_same             expected, actual
    assert_operator         object1, operator, object2
    assert_nothing_raised   *args
    assert_not_same         expected, actual
    assert_not_equal        expected, actual
    assert_not_nil          object
    assert_no_match         regexp, string
    assert_throws           expected_symbol, &proc
    assert_nothing_thrown   &proc
    assert_in_delta         expected_float, actual_float, delta
    assert_send             send_array

## Rails Assertions

    assert_response         type
    assert_redirected_to    options = {}
    assert_template         expected
    assert_recognizes       expected_options, path, extras={}
    assert_generates        expected_path, options, defaults={}, extras = {}

    assert_routing          path, options, defaults={}, extras={}
    assert_tag              *opts
    assert_no_tag           *opts
    assert_dom_equal        expected, actual
    assert_dom_not_equal    expected, actual
    assert_valid            record
