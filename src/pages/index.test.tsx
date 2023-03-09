import {render, screen } from '@testing-library/react'
import '@testing-library/jest-dom'
import Home from './index'

describe('Home', () => {
  test('renders a heading', () => {
    const {getByText} = render(<Home />)

    console.log(getByText)

    // expect(getByText('Create T3 App')).toBeInTheDocument()
  })
})