import massive.munit.TestSuite;

import noor.ExceptionTest;
import noor.StringExtensionsTest;
import noor.io.FileSystemExtensionsTest;
import noor.io.ConfigReaderTest;

/**
 * Auto generated Test Suite for MassiveUnit.
 * Refer to munit command line tool for more information (haxelib run munit)
 */

class TestSuite extends massive.munit.TestSuite
{		

	public function new()
	{
		super();

		add(noor.ExceptionTest);
		add(noor.StringExtensionsTest);
		add(noor.io.FileSystemExtensionsTest);
		add(noor.io.ConfigReaderTest);
	}
}
