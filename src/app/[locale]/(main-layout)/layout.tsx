import { MainLayout } from '@/components';
import React from 'react';
import { PropsParams } from '@/types/Layout';
import { locales } from '@/static/locales';

//function to generate the routes for all the locales
export function generateStaticParams() {
  return locales.map((locale) => ({ locale }));
}

export default async function Layout({ children, params }: { children: React.ReactNode, params: Promise<PropsParams> }) {
  const { locale } = await params;
  return (
    <>
      <MainLayout params={{
        locale: locale,
      }}>{children}</MainLayout>
    </>
  );
}
