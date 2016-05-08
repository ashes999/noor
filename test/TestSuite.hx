import massive.munit.TestSuite;

import noor.ExceptionTest;
import noor.StringExtensionsTest;
import noor.MathExtensionsTest;
import noor.io.ConfigReaderTest;
import noor.io.FileSystemExtensionsTest;

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
		add(noor.MathExtensionsTest);
		add(noor.io.ConfigReaderTest);
		add(noor.io.FileSystemExtensionsTest);
	}
}
