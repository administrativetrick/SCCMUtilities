# SCCMUtilities

What is it?
-----------

SCCM Utilities is a collection of PowerShell Modules meant to aid in the adminitration of SCCM.
It is a growing collection that is meant to be environment agnostic and modular by design.
Environment specific variables will be implemented by importing JSON configuration files into the the modules.

Do I need any Software?
------------------------

For the Cmdlets to run correctly you need Configuration Manager Console installed on your machine.

How do I set it up?
-------------------

Copy the SCCMUtilites folder to a path that exists in $env:PSModulePath.
Create your JSON file according to your environment you are currently in, example below.

CollectionConfig.json
-----------------------

| Environment | Name | LimitingCollection |
|-------------|------|--------------------|
| ContosoCommercial | INSTALL - CON - | CON00001 |
| ContosoFederall | INSTALL - FED - | CON00002 |


Reference the default CollectionConfig.json to see how JSON File should be built.
