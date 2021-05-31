const { TerraformGenerator } = require('terraform-generator');
const path = require('path');
const pkg = require('../../package.json');
const fnName = pkg.name.replaceAll('-','_');

const config = {
  env: process.env.NODE_ENV || 'dev'
};

const tfg = new TerraformGenerator({
  required_version: '>= 0.13.0'
});

tfg.provider('aws', {
  region: 'eu-west-1',
  version: '3.35.0',
  allowed_account_ids: ['000000000']
});

tfg.data('archive_file', `${fnName}`, {
  output_path: `\${path.module}/.terraform_artifacts/${fnName}.zip`,
  source_dir: `../../dist`,
  type: 'zip'
})

tfg.resource('aws_lambda_function', fnName, {
  function_name: fnName,
  handler: 'index.handler',
  runtime: 'nodejs14.x',
  memory_size: 512,
  timeout: 60,
  role: '<use a qualified arn>',
  filename: `data.archive_file.${fnName}.output_path`,
  source_code_hash: `data.archive_file.${fnName}.output_base64sha256`,
  environment: {
    variables: {
      foo: 'bar'
    }
  }
});

tfg.write({
  dir: path.join('terraform', config.env),
  format: true
});
