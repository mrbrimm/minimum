import { useState, useEffect } from 'react';
import { useGoogleReCaptcha } from 'react-google-recaptcha-v3';

export default function ContactForm() {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [phone, setPhone] = useState('');
  const [message, setMessage] = useState('');
  const [status, setStatus] = useState(null);
  const { executeRecaptcha } = useGoogleReCaptcha();

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!executeRecaptcha) {
      console.error('executeRecaptcha not available');
      setStatus('reCAPTCHA not available');
      return;
    }

    try {
      console.log('Executing reCAPTCHA...');
      const token = await executeRecaptcha('contact_form');
      console.log('reCAPTCHA token:', token);

      const response = await fetch('/api/contact', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ name, email, phone, message, recaptchaToken: token }),
      });
      const data = await response.json();
      if (response.ok) {
        setStatus('Message sent successfully!');
        setName('');
        setEmail('');
        setPhone('');
        setMessage('');
      } else {
        console.error('Server response error:', data);
        setStatus(`Error: ${data.message}`);
      }
    } catch (error) {
      console.error('Error during form submission:', error);
      setStatus('An error occurred. Please try again later.');
    }
  };

  return (
    <form onSubmit={handleSubmit} className="max-w-lg">
      <div className="mb-4">
        <label htmlFor="name" className="block mb-2">Name</label>
        <input
          type="text"
          id="name"
          value={name}
          onChange={(e) => setName(e.target.value)}
          required
          className="bg-gray-200 w-full px-3 py-2 border rounded"
        />
      </div>
      <div className="mb-4">
        <label htmlFor="email" className="block mb-2">Email</label>
        <input
          type="email"
          id="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
          className="bg-gray-200 w-full px-3 py-2 border rounded"
        />
      </div>
      <div className="mb-4">
        <label htmlFor="phone" className="block mb-2">Phone</label>
        <input
          type="tel"
          id="phone"
          value={phone}
          onChange={(e) => setPhone(e.target.value)}
          className="bg-gray-200 w-full px-3 py-2 border rounded"
        />
      </div>
      <div className="mb-4">
        <label htmlFor="message" className="block mb-2">Message</label>
        <textarea
          id="message"
          value={message}
          onChange={(e) => setMessage(e.target.value)}
          required
          className="bg-gray-200 w-full px-3 py-2 border rounded"
          rows="4"
        ></textarea>
      </div>
      <button type="submit" className="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
        Send Message
      </button>
      {status && <p className="mt-4">{status}</p>}
    </form>
  );
}