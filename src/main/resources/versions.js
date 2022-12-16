/*-
 * #%L
 * wsdlit
 * %%
 * Copyright (C) 2021 - 2022 Axencia para a Modernización Tecnolóxica de Galicia (AMTEGA) - Xunta de Galicia
 * %%
 * This file is part of "wsdlit".
 * 
 * "wsdlit" is free software: you can redistribute it and/or modify
 * it under the terms of:
 * European Union Public License, either Version 1.2 or – as soon
 * they will be approved by the European Commission - subsequent versions of
 * the EUPL;
 * 
 * "wsdlit" is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * European Union Public License for more details.
 * 
 * You may obtain a copy of tce European Union Public Licence at:
 * http://joinup.ec.europa.eu/software/page/eupl/licence-eupl
 * #L%
 */

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
    versionButton.innerText = "${project.version}";
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
    var newUrl = window.location.href.replace( "${project.version}", newVersion );
    window.location.href = newUrl;
}
