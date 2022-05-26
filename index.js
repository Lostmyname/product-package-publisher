const shell = require('shelljs');
const { exit } = require('process');

shell.exec('./entrypoint.sh', (error, stdout, stderr) => {
  if (error) {
    console.error(`exec error: ${error}`);
    exit(1);
  }
  console.log(`stdout: ${stdout}`);
  console.error(`stderr: ${stderr}`);
});
