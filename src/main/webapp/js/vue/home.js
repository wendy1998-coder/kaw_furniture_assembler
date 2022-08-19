if (document.readyState) {
    new Vue( {
        el: '#vue',
        data: {
            headerMenuItems: [
                {
                    name: 'Furniture assembler',
                    page: 'assembler',
                    active: false
                },
                {
                    name: 'Catalog',
                    page: 'catalog.jsp',
                    active: false
                }
            ],
            footerMenuItems: [
                {
                    name: 'Contact',
                    page: 'contact.jsp',
                    active: false,
                    addToTop: true
                },
                {
                    name: 'Kaw forum',
                    url: 'https://forum.kingdomsatwar.com/',
                    active: false,
                    addToTop: false
                }
            ]
        }
    });
}