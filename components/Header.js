import Link from 'next/link';
import { useSession, signOut } from "next-auth/react";

const Header = () => {
  const { data: session } = useSession()

  return (
    <header className="bg-white shadow-md">
      <nav className="container mx-auto px-6 py-3">
        <div className="flex justify-between items-center">
          <Link href="/" className="text-xl font-bold text-gray-800">
            Hello
          </Link>
          
         
          <div>
            <Link href="/index.html" className="mr-4 text-blue-500 hover:text-blue-700">
              Static Home index.html
            </Link>
            <Link href="/" className="mr-4 text-blue-500 hover:text-blue-700">
              Index.js
            </Link>
            <Link href="/about" className="mr-4 text-blue-500 hover:text-blue-700">
             About
            </Link>
            <Link href="/contact" className="mr-4 text-blue-500 hover:text-blue-700">
              Contact
            </Link>
            <Link href="/" className="inline-block bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
                Buy 
            </Link>
          </div>
        </div>
      </nav>
    </header>
  );
};

export default Header;

