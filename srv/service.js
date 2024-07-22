const cds = require('@sap/cds')

module.exports = async (srv) => {

    const db = await cds.connect.to('db')

    // Trigger disponiveis em uma entidade
    srv.before('CREATE', 'Customers', (req) => {
        const data = req.data

            if (data.name === 'Wanderson') {
                return req.error(400,'Nome não permitido !!!!')
            }

    })

    srv.on('CREATE', 'Customers',async (req) => {
        const data = req.data

        const response = await INSERT(data).into(db.entities.Customers)

        console.log(response)

        return req.data

    })

    srv.after('CREATE', 'Customes', (req) => {

    })

   //srv.on('read')
   // srv.on('UPDATE')
   // srv.on('DELETE')


}