import { GoogleReCaptchaProvider } from 'react-google-recaptcha-v3';
import ContactForm from '../components/ContactForm';
import Link from 'next/link';

export default function Contact() {
  return (
    <GoogleReCaptchaProvider
      reCaptchaKey={process.env.NEXT_PUBLIC_RECAPTCHA_SITE_KEY}
      scriptProps={{
        async: false,
        defer: false,
        appendTo: 'head',
        nonce: undefined,
      }}
    >
      <div className="container mx-auto p-4 pt-6 mb-8">
          <h1 className="text-3xl font-bold">Contact Us</h1>
        <ContactForm />
      </div>
    </GoogleReCaptchaProvider>
  );
}