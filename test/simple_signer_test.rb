# coding=utf-8

require 'test/unit'
require 'simple_signer'

class SimpleSignerTest < Test::Unit::TestCase

  def test_raise_secret_key_is_required
    assert_raise RuntimeError, 'secret_key is required!' do
      SimpleSigner.sign
    end
  end

  def test_raise_string_is_required
    assert_raise RuntimeError, 'string is required!' do
      SimpleSigner.sign :secret_key => 'abc'
    end
  end

  def test_sign_strings
    key    = 'DrAGMrjPbJWHn+9ioJrA3s5/Q3ownDFBYZqFcZLm'
    string = 'Some string to sign => é ê ç ê á ṕ ǵ ś "a \'b <c/> \\d %e'

    expected_signature = 'k0YywdmJaMbQYfWXUZzRkc/Zhiw='
    given_signature    = SimpleSigner.sign :secret_key => key, :string => string

    assert_equal expected_signature, given_signature
  end

  def test_escape_strings
    string   = 'CfsldUIyOOORHjnE8PIl0k0xmOQ='
    expected = 'CfsldUIyOOORHjnE8PIl0k0xmOQ%3D'

    assert_equal expected, SimpleSigner.escape(string)
  end

  def test_unescape_escaped_strings
    string   = 'CfsldUIyOOORHjnE8PIl0k0xmOQ%3D'
    expected = 'CfsldUIyOOORHjnE8PIl0k0xmOQ='

    assert_equal expected, SimpleSigner.unescape(string)
  end

  def test_unescape_only_escaped_strings
    string   = 'CfsldUIyOOORHjnE8PIl0k0xmOQ='
    expected = 'CfsldUIyOOORHjnE8PIl0k0xmOQ='

    assert_equal expected, SimpleSigner.unescape(string)
  end

end
