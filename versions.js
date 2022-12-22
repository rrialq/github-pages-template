function generateVersionSelector() {
    const removeChildren = (parent) => {
        while ( parent.lastChild ) {
            parent.removeChild( parent.lastChild );
        }
    };
    const versionElement = document.getElementById( "projectVersion" );
    const versionButton = document.createElement( "button" );
    const versionButtonLabel = document.createTextNode( versionElement.innerText.split( ":" ) [0] + ": " );
    const versionMenu = createVersionMenu();

    removeChildren( versionElement );
    versionButton.innerText = "1.0-SNAPSHOT";
    versionButton.id = "selectProjectVersion";
    versionElement.appendChild( versionButtonLabel );
    versionElement.appendChild( versionButton );
    versionElement.appendChild( versionMenu );
}

function createVersionMenu() {
    const versions = VERSIONS;
    const nav = document.createElement( "nav" );
    const ul = document.createElement( "ul" );

    nav.classList.add( "versionMenu" );
    nav.appendChild( ul );

    for ( let i = 0; i < versions.length; i++ ) {
        const version = VERSIONS[ i ];
        const li = document.createElement( "li" );
        const button = document.createElement( "button" );
        button.value = version;
        button.innerText = version;
        button.onclick = function() { changeVersion( version ); };

        li.appendChild( button );
        ul.appendChild( li );
    }
    return nav;
}

function changeVersion( newVersion ) {
    var newUrl = window.location.href.replace( "1.0-SNAPSHOT", newVersion );
    window.location.href = newUrl;
}

const VERSIONS = "".split( "," );
