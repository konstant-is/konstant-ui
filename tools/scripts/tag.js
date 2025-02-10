import fs from 'fs'
import { execSync } from 'child_process'
import path from 'path'
import { fileURLToPath } from 'url'

// Simulate __dirname
const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)

const createGitTag = () => {
  const packageJsonPath = path.resolve(__dirname, '../package.json')

  try {
    // Read the current version from package.json
    const packageJson = JSON.parse(fs.readFileSync(packageJsonPath, 'utf8'))
    const version = packageJson.version

    if (!version) {
      throw new Error('Version not found in package.json. Please ensure the version is set.')
    }

    // Create the tag name (e.g., "v1.0.0")
    const tagName = `v${version}`

    // Execute Git commands to create and push the tag
    console.log(`Creating Git tag: ${tagName}`)

    execSync(`git tag -a ${tagName} -m "Release ${tagName}"`)
    execSync(`git push --follow-tags`)
    console.log(`Changes committed and tagged as ${tagName}`)

    console.log(`${tagName} pushed to remote successfully`)
  } catch (error) {
    console.error('Error creating Git tag:', error.message)
    process.exit(1)
  }
}

// Run the script
createGitTag()
