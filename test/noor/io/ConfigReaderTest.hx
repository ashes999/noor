package noor.io;

import noor.io.ConfigReader;
using massive.munit.Assert;

@:access(noor.io.ConfigReader)
class ConfigReaderTest
{
    @Before
    public function resetConfigReader()
    {
        ConfigReader.clear();
    }
    
    @Test
    public function loadThrowsIfJsonIsInvalid()
    {
        Assert2.throws(String, function() {
           ConfigReader.load('NOT valid JSON!', new Map<String, String>()); 
        });
    }
    
    @Test
    public function getGetsValuesFromJsonAndUrlParameters()
    {
        ConfigReader.load('{ "name": "ashes999", "unicorns": 37 }', [ "isOnGitHub" => "true" ] );
        Assert.areEqual("ashes999", ConfigReader.get("name"));
        Assert.areEqual(37, ConfigReader.get("unicorns"));
        Assert.areEqual(true, ConfigReader.get("isOnGitHub"));
    }
    
    @Test
    public function urlValuesOverrideJsonValues()
    {
        ConfigReader.load('{ "unicorns": 37 }', [ "unicorns" => "0" ] );
        Assert.areEqual(0, ConfigReader.get("unicorns"));
    }
    
    @Test
    public function getReturnsNullIfJsonAndUrlDontHaveThatKey()
    {
        ConfigReader.load('{ "name": "ashes999" }', [ "equipment" => "bronze shield" ]);
        Assert.isNull(ConfigReader.get("age"));
    }
} 