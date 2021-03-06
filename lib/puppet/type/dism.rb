Puppet::Type.newtype(:dism) do
  @doc = "Manages Windows features via dism."

  ensurable do
    desc "Windows feature install state."

    defaultvalues

    newvalue(:present) do
      provider.create
    end

    newvalue(:absent) do
      provider.destroy
    end
  end

  newparam(:name, :namevar=>true) do
    desc "The Windows feature name (case-sensitive)."
  end

  newparam(:answer) do
    desc "The answer file for installing the feature."
  end

  newparam(:source) do
    desc "path to the xsx directory from the install image"
  end

  newparam(:all_dependencies) do
    desc "Append a /All instructing DISM to fetch all dependencies for the feature automatically"
  end

  newparam(:exitcode, :array_matching => :all) do
    desc "DISM installation process exit code"
    defaultto([0, 3010])
  end
end
