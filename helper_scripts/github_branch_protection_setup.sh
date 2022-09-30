#!/bin/bash

echo "Enter the repo owner: "
read owner
echo "Enter the repo name: "
read name
repositoryId="$(gh api graphql -f query='{repository(owner:"'$owner'",name:"'$name'"){id}}' -q .data.repository.id)"


gh api graphql -f query='
mutation($repositoryId:ID!,$branch:String!,$requiredReviews:Int!) {
  createBranchProtectionRule(input: {
    repositoryId: $repositoryId
    pattern: $branch
    requiresApprovingReviews: true
    requiredApprovingReviewCount: $requiredReviews
  }) { clientMutationId }
}' -f repositoryId="$repositoryId" -f branch="[main,master]*" -F requiredReviews=1
