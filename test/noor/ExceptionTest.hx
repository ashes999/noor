package noor;

using massive.munit.Assert;

class ExceptionTest
{
    @Test
    public function constructorSetsMessage()
    {
        var expected:String = "Not yet implemented";
        var ex = new Exception(expected);
        
        try
        {
            throw new Exception(expected);
        }
        catch (e:Exception)
        {
            Assert.areEqual(e.message, expected);
        }
    } 
} 