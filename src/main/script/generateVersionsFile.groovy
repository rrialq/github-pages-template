final CURRENT_VERSION = project.version
final CURRENT_VERSION_IS_SNAPSHOT = CURRENT_VERSION.endsWith( "-SNAPSHOT" )
final String OUTPUT_DIRECTORY_VALUE = project.build.directory
final File OUTPUT_DIRECTORY = new File ( OUTPUT_DIRECTORY_VALUE )
final VERSIONS =
    project
        .properties[ 'versionList' ]
        .findAll {
            it.endsWith( "-SNAPSHOT" ) == CURRENT_VERSION_IS_SNAPSHOT
        }
final FILE = new File( OUTPUT_DIRECTORY, "versions.js" )
final JS_VERSIONS = '\nconst VERSIONS = "' + VERSIONS.join( ',' ) + '".split( "," );\n'

FILE << JS_VERSIONS
