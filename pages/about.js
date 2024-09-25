import { useState } from 'react';
import Link from 'next/link';

const FAQItem = ({ anchor, question, answer }) => {
  const [isOpen, setIsOpen] = useState(false);

  return (
    <div className="border-bg-sky-400 border-2 rounded-md" id={anchor}>
      <button
        className="flex bg-slate-200 justify-between items-center w-full text-left"
        onClick={() => setIsOpen(!isOpen)}
      >
        <span className="font-semibold">{question}</span>
        <span>{isOpen ? '−' : '+'}</span>
      </button>
      {isOpen && <p className="mt-2 text-gray-600 p-2.5 ">{answer}</p>}
    </div>
  );
};

export default function About() {
  

  return (
    <div className="container mx-auto p-4 pt-6 mb-8">
      <h1 className="text-3xl font-bold">About </h1>
      
      <h2 className="text-2xl font-bold mb-4 mt-4">Frequently Asked Questions</h2>
      <div className="space-y-4">
        
      </div>
      <Link href="/" className="mt-8 inline-block bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
        Back to Home
      </Link>
    </div>
  );
}