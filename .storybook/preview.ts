import type { Preview } from '@storybook/react'

import './globals.scss'
import '../src/styles/styles.scss'

const preview: Preview = {
  parameters: {
    controls: {
      matchers: {
        color: /(background|color)$/i,
        date: /Date$/i,
      },
    },
  },
}

export default preview
