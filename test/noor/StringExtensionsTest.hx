package noor;

using massive.munit.Assert;
using noor.StringExtensions;

class StringExtensionsTest
{
    @Test
    public function isNullOrWhitespaceReturnsTrueForNullOrWhiteSpace()
    {
        Assert.isTrue(StringExtensions.isNullOrWhitespace(null));
        Assert.isTrue("".isNullOrWhitespace());
        Assert.isTrue("  ".isNullOrWhitespace());
    }
    
    @Test
    public function isNullOrWhitespaceReturnsFalseForStrings()
    {
        Assert.isFalse("1".isNullOrWhitespace());
        Assert.isFalse("abC".isNullOrWhitespace());
        Assert.isFalse("this is a string with spaces.".isNullOrWhitespace());
    }
}