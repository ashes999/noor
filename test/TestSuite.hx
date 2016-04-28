import massive.munit.TestSuite;

import noor.ExceptionTest;
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
		add(noor.io.FileSystemExtensionsTest);
	}
}