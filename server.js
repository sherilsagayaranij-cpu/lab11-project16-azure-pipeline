const http = require('http');
const port = process.env.PORT || 8080;
const app = (req, res) => {
 const path = (req.url || '/').split('?')[0];
 res.setHeader('Content-Type', 'application/json');
 if (path === '/health') return res.end(JSON.stringify({status:'healthy',environment:process.env.ENVIRONMENT || 'local',version:'1.0.0'}));
 if (path === '/' || path === '/api/info') return res.end(JSON.stringify({project:'LAB 11 Project 16',environment:process.env.ENVIRONMENT || 'local',message:'Azure deployment pipeline running'}));
 res.statusCode=404;res.end(JSON.stringify({error:'not found'}));
};
if (require.main === module) http.createServer(app).listen(port,'0.0.0.0');
module.exports=app;
