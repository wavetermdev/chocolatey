$HEAD = $(git rev-parse HEAD)
$NUSPEC_B64 = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes([System.IO.File]::ReadAllText('wave\wave.nuspec')))
$CHOCOLATEY_B64 = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes([System.IO.File]::ReadAllText('wave\tools\chocolateyinstall.ps1')))
$QUERY = @"
mutation createCommit {
  createCommitOnBranch(input: {branch: {repositoryNameWithOwner: "wavetermdev/chocolatey", branchName: "main"}, message: {headline: "chore: update nuspec and chocolateyinstall with new release"}, fileChanges: {additions: [{path: "wave/wave.nuspec", contents: "$NUSPEC_B64"},{path: "wave/tools/chocolateyinstall.ps1", contents:"$CHOCOLATEY_B64"}]}, expectedHeadOid: "$HEAD"}) {
    commit {
      url
    }
  }
}
"@

gh api graphql -f query=$QUERY  