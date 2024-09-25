import '../styles/globals.css'
import Header from '../components/Header';
import Footer from '../components/Footer';
import { SessionProvider } from "next-auth/react";

function MyApp({ Component, pageProps: { user, session, ...pageProps } }) {
  return (
    <SessionProvider session={session}>
      <div className="flex flex-col min-h-screen">
        <Header />
        <main className="flex-grow">
          <Component {...pageProps} />
        </main>
        <Footer />
      </div>
    </SessionProvider>
  );
}

export default MyApp;