=begin
This file is part of SimpleSigner.

SimpleSigner is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, version 3 of the License.

SimpleSigner is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with SimpleSigner.  If not, see <http://www.gnu.org/licenses/>.
=end

require 'openssl'
require 'base64'
require 'cgi'

class SimpleSigner

  def self.sign options = {}
    raise 'secret_key is required!' unless options.include?(:secret_key) and options[:secret_key]
    raise 'string is required!'     unless options.include?(:string)     and options[:string]

    signed = OpenSSL::HMAC.digest('sha1', options[:secret_key], options[:string].encode('utf-8'))

    Base64.encode64(signed).strip
  end

  def self.escape token
    token.empty? ? token : CGI.escape(token)
  end

  def self.unescape token
    (token.empty? or not token.include?('%')) ? token : CGI.unescape(token)
  end

end
