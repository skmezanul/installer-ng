#
# Copyright 2012-2014 Chef Software, Inc.
# Copyright 2015 Scalr, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "libuuid"
default_version "2.21"

# We use the version in util-linux, and only build the libuuid subdirectory
source url: "ftp://ftp.kernel.org/pub/linux/utils/util-linux/v#{version}/util-linux-#{version}.tar.gz"

version '2.21' do
  source md5: "4222aa8c2a1b78889e959a4722f1881a"
end

relative_path "util-linux-#{version}"

license path: 'COPYING'


build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "./configure --prefix=#{install_dir}/embedded", env: env

  make "-j #{workers}", env: env, cwd: "#{project_dir}/libuuid"
  make "-j #{workers} install", env: env, cwd: "#{project_dir}/libuuid"
end
