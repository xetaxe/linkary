import React, { ReactElement } from 'react'
import {render, RenderOptions} from '@testing-library/react'
import { SessionProvider } from "next-auth/react";

const AllTheProviders = ({children}: {children: React.ReactNode}) => {
  return (
    <SessionProvider session={null}>
        {children}
    </SessionProvider>
  )
}

const customRender = (
    ui: ReactElement,
    options?: Omit<RenderOptions, 'wrapper'>,
  ) => render(ui, {wrapper: AllTheProviders, ...options})

// re-export everything
export * from '@testing-library/react'

// override render method
export {customRender as render}