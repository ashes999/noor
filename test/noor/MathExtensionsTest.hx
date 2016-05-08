package noor;

using massive.munit.Assert;
import noor.Exception;
using noor.MathExtensions;

class MathExtensionsTest
{
    @Test
    public function randomBetweenReturnsNumbersInRange()
    {
        // a <= n < b
        var tries:Int = 0;
        var result:Int = 0;
        
        while (tries++ <= 100)
        {
            result = Math.randomBetween(1, 6);
            Assert.isTrue(result >= 1 && result < 6);
        }
    }
    
    @Test
    public function randomBetweenWorksWithNegativeNumbers()
    {
        // a negative
        var result:Int = Math.randomBetween(-10, 10);
        Assert.isTrue(result >= -10 && result < 10);
        
        // a and b negative
        result = Math.randomBetween(-17, -8);
        Assert.isTrue(result >= -17 && result < -8);
    }
    
    @Test
    public function randomBetweenThrowsIfBIsGreaterThanOrEqualToA()
    {
        Assert2.throws(Exception, function() {
            Math.randomBetween(3, 3);
        });
        
        Assert2.throws(Exception, function() {
            Math.randomBetween(10, 4);
        });
        
        Assert2.throws(Exception, function() {
            Math.randomBetween(10, -4);
        });
        
        Assert2.throws(Exception, function() {
            Math.randomBetween(-1, -4);
        });
    }
}