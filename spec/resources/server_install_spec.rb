require 'spec_helper'

describe 'postgresql_server_install' do
  step_into :server_install

  context 'default ident conf' do
    recipe do
      postgresql_server_install 'test' do
        version '10'
      end
    end

    context 'on ubuntu' do
      platform 'ubuntu'

      it do
        is_expected.to install_postgresql_server_install('test').with(ident_file: '/etc/postgresql/10/main/pg_ident.conf')
      end
    end

    context 'on fedora' do
      platform 'fedora'

      it do
        is_expected.to install_postgresql_server_install('test').with(ident_file: '/var/lib/pgsql/10/data/pg_ident.conf')
      end
    end
  end

  context 'default hba conf' do
    recipe do
      postgresql_server_install 'test' do
        version '10'
      end
    end

    context 'on ubuntu' do
      platform 'ubuntu'

      it do
        is_expected.to install_postgresql_server_install('test').with(hba_file: '/etc/postgresql/10/main/pg_hba.conf')
      end
    end

    context 'on fedora' do
      platform 'fedora'

      it do
        is_expected.to install_postgresql_server_install('test').with(hba_file: '/var/lib/pgsql/10/data/pg_hba.conf')
      end
    end
  end
end
