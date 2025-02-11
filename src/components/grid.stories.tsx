import { PropsWithChildren } from 'react'
import type { Meta, StoryObj } from '@storybook/react'

import { Grid } from './grid'

const meta = {
  title: 'components/grid',
  component: Grid,
  parameters: {
    // Optional parameter to center the component in the Canvas. More info: https://storybook.js.org/docs/configure/story-layout
    // layout: 'centered',
  },
  tags: ['autodocs'],
} satisfies Meta<typeof Grid>

export default meta
type Story = StoryObj<typeof meta>

const Col = (props: PropsWithChildren) => {
  return (
    <div
      style={{
        padding: 8,
        background: 'rgba(255, 0, 0, 0.1)',
      }}
    >
      {props.children}
    </div>
  )
}
export const primary: Story = {
  args: {
    cols: 3,
    gutter: '24px',
    children: (
      <>
        {new Array(6).fill('').map((_, index) => {
          return <Col key={index}>Item {index + 1}</Col>
        })}
      </>
    ),
  },
}

export const responsive: Story = {
  args: {
    cols: {
      sm: 1,
      md: 2,
      lg: 4,
      xl: 8,
    },
    gutter: {
      sm: '8px',
      md: '16px',
      lg: '24px',
    },
    children: (
      <>
        {new Array(6).fill('').map((_, index) => {
          return <Col key={index}>Item {index + 1}</Col>
        })}
      </>
    ),
  },
}
